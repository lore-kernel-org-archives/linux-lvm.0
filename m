Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0626D1111C65
	for <linux-lvm@redhat.com>; Sun, 30 Aug 2020 15:49:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC299856DFD
	for <linux-lvm@redhat.com>; Sun, 30 Aug 2020 15:49:55 +0000 (UTC)
References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
	<20200828182608.GA17233@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
Date: Sun, 30 Aug 2020 23:49:38 +0800
In-Reply-To: <20200828182608.GA17233@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

Hello David, & Zdenek,

I got your meaning.
Thanks to take time to review my patch and explain the reason.

---
For Dave's question:
> Zhao, I think we should revert that commit, and come up with a new word to
> describe this thing (which also needs a clear definition), and report it
> in lvs.

For the lvs, I ever said in previous mail:
 is it necessary to add a new letter '(N)ot_available' in bit 9 (Volume Health) for top layer LV.

in my opinion, the 'not available' means the LV can't correctly do r/w io.

for raid, if the missing or breaking underlying devs number beyond raid level limit. the 
'not available' shoud be display.

for linear, any one of underlying dev is missing, upper layer module like fs may don't work
(e.g. missing first disk, fs will missing w/r first disk's super-block metadata). the
'not available' should be display.

for other type LV, I don't have too much experience to answer this question.

I give two example for my meaning
1> 
a raid1 lv missing one of underlying devs, the bit-9 won't change, keep 'p'
# lvs -a
  LV                 VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  raid1lv            vg1 rwi-a-r-p- 92.00m                                    100.00          
  [raid1lv_rimage_0] vg1 iwi-aor--- 92.00m                                                    
  [raid1lv_rimage_1] vg1 iwi-aor-p- 92.00m                                                    
  [raid1lv_rmeta_0]  vg1 ewi-aor---  4.00m                                                    
  [raid1lv_rmeta_1]  vg1 ewi-aor-p-  4.00m 

2>
if a raid0 is missing one of underlying devs, the bit-9 should change from below status:
# lvs -a
  WARNING: Couldn't find device with uuid iOTRmc-hdJx-p3Cd-DrBR-WRJo-Xweh-GTDJUg.
  WARNING: VG vg1 is missing PV iOTRmc-hdJx-p3Cd-DrBR-WRJo-Xweh-GTDJUg.
  LV                 VG  Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  raid0lv            vg1 rwi-a-r-p- 192.00m                                                    
  [raid0lv_rimage_0] vg1 iwi-aor---  96.00m                                                    
  [raid0lv_rimage_1] vg1 iwi-aor-p-  96.00m

to below (a new 'n' letter):
# lvs -a
  WARNING: Couldn't find device with uuid iOTRmc-hdJx-p3Cd-DrBR-WRJo-Xweh-GTDJUg.
  WARNING: VG vg1 is missing PV iOTRmc-hdJx-p3Cd-DrBR-WRJo-Xweh-GTDJUg.
  LV                 VG  Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  raid0lv            vg1 rwi-a-r-n- 192.00m                                                    
  [raid0lv_rimage_0] vg1 iwi-aor---  96.00m                                                    
  [raid0lv_rimage_1] vg1 iwi-aor-p-  96.00m


At last, the new letter attr needs a lot of jobs to do and need to take care of various LV type.
I can change my patch to modify lvs attr field for linear & raid type. 
But other LV types works need to do by other guys. 

Thanks,
heming

On 8/29/20 2:26 AM, David Teigland wrote:
> On Fri, Aug 28, 2020 at 06:04:44PM +0200, Zdenek Kabelac wrote:
>> LV 'available' has one simple meaning - LV is present in DM table.
>> Status is either available or NOT available.
> 
> LV Status can also be "suspended", so there's already some variation in
> that field (which is why these free-form lvdisplay fields should be
> avoided.)  But I agree, it's probably best to leave lvdisplay alone for
> historical purposes and add anything new using just lvs fields.
> 
> Zhao, I think we should revert that commit, and come up with a new word to
> describe this thing (which also needs a clear definition), and report it
> in lvs.
> 
> Dave
> 
