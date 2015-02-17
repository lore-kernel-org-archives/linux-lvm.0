Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1HKQ8Ga015441
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 15:26:08 -0500
Received: from mail.pdinc.us (mail.pdinc.us [67.90.184.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1HKQ51W014947
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 15:26:06 -0500
Received: from black (nsa1.pdinc.us [67.90.184.2]) (authenticated bits=0)
	by mail.pdinc.us (8.14.4/8.12.11) with ESMTP id t1HKQ4Ob010148
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 15:26:04 -0500
From: "Jason Pyeron" <jpyeron@pdinc.us>
References: <848E1BB85A9C4FB5A91BC299FEB36775@black>
	<54E38E38.6040506@gathman.org>
Date: Tue, 17 Feb 2015 15:26:02 -0500
Message-ID: <B521BF97D371413A932CAB72C17E28B7@black>
MIME-Version: 1.0
In-Reply-To: <54E38E38.6040506@gathman.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Confusing error: No space left on device
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> -----Original Message-----
> From: Stuart Gathman
> Sent: Tuesday, February 17, 2015 13:54
> 
> On 02/17/2015 11:20 AM, Jason Pyeron wrote:
> > This is likely a problem between keyboard and chair, but it 
> has got me confused all the same.
> >
> > I was having issues with rsync, so I switched to dd and the 
> same problem persists.
> >
> > Any suggestions?
> >
> > History says "lvcreate --size 8589934592b --name 
> ciphershed-dmz-http vg_five66
> "No space left on device" is a filesystem error.   This happens to me 
> occasionally when the /dev/... path does not actually exist 
> for various 
> reasons, and the output is going into the root filesystem instead.

I knew the problem was between the keyboard and chair.

> 
> In your case, the "varying reason" is rsync.  Rsync removes 
> /dev/vg_five66/ciphershed-dmz-http, and creates a regular 
> file - which 
> it proceeds to fill with data from your source lv until 
> running out of 
> space in your root fs.  When you removed and recreated the LV, this 
> removed the rsync handiwork and your subsequent dd worked again.  But 
> when you ran rsync again - bye bye link to LV device node.

I thought I was being smart: rsync --inplace --copy-devices --partial --compress --progress ...

Turns out I need: rsync --write-devices ... 

Which is not in RHEL6, so off to patch from https://git.samba.org/?p=rsync-patches.git;a=blob;f=write-devices.diff

> 
> There is a patch to rsync for copying devices nodes - but the 
> /dev/... 
> pathnames are often symlinks.

Rsync to /dev/dm-2 has the same issue:

if (statret == 0 && !S_ISREG(sx.st.st_mode)) {
   if (delete_item(fname, sx.st.st_mode, del_opts | DEL_FOR_FILE) != 0)
...

The above patch changes it to:

if (statret == 0 && !(S_ISREG(sx.st.st_mode) || (write_devices && IS_DEVICE(sx.st.st_mode)))) {
...

> There are utilities for copying block devices with rsync protocol - I 
> have a python script that I have used around somewhere, but I 
> can't put 
> my fingers on it at the moment.

Thanks! 

Here is the RHEL6 rsync srpm (patch) and results, for all the others and Google.

https://bugzilla.redhat.com/show_bug.cgi?id=1193654

-Jason
