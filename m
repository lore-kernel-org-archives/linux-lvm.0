Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kA2GBYB0010834
	for <linux-lvm@redhat.com>; Thu, 2 Nov 2006 11:11:34 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <Pine.LNX.4.58.0611011953150.32134@shell2.speakeasy.net>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<2e9d2be4483db00be84afd0aca33e698@redhat.com>
	<Pine.LNX.4.64.0610302250450.19176@localhost>
	<9a4fd1bc1dee8da54e868d07f107b3b3@redhat.com>
	<Pine.LNX.4.58.0611011953150.32134@shell2.speakeasy.net>
Message-Id: <172c1cd542e581bc25f1bfb25e7b819a@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Date: Thu, 2 Nov 2006 10:15:29 -0600
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

If linux reorders your devices, it won't affect LVM.

The two logical volumes you mentioned do not overlap.  The important 
thing to look at there is the "stripes" section.  You can see that 
'gen-website' lives on 'pv5' (i.e. the 5th physical volume in the 
volume group) and that it starts at extent '0'.  'dvd' also lives on 
'pv5', but it starts at extent 3840 - directly after 'gen-website'.

So, you are ok to do the lvremove maingroup/dvd.

  brassow

P.S.  If you accidentally did a 'lvremove -ff <vg>' and wiped out all 
your volumes, there is no need to panic.  You can simply use 
'vgcfgrestore' to bring them back.  Most mistakes in LVM2 are 
reversible, which is nice.  :)

On Nov 1, 2006, at 7:07 PM, Matt McHenry wrote:

> On Wed, 1 Nov 2006, Jonathan E Brassow wrote:
>
>> You can certainly try an 'lvremove maingroup/dvd'.  It seems to me 
>> that
>> the logical volume is in the metadata (you can look for it in
>> /etc/lvm/backup/maingroup), but for some reason it is not able to
>> complete the load of that device into device-mapper.  Because it only
>> partially succeeds, it is giving you a device with no table...  After
>> doing the 'lvremove' you may need to also do a 'dmsetup remove
>> maingroup-dvd'.  Once completely removed, you could try your 
>> 'lvcreate'
>> again.
>
> 	I took a look in /etc/lvm/backup/maingroup.  Again keeping in mind
> that I don't know much about LVM, it looks to me like the 'gen-website'
> and 'dvd' LVs are overlapping somehow.  Assuming that's correct, I'm 
> still
> reluctant to try any 'remove' commands because I don't want to destroy 
> the
> data on the gen-website LV.  So once again I'll await further replies. 
>  :)
>
>                 gen-website {
>                         id = "GhsR38-lmVZ-5gyN-fbt3-RWJv-f9rF-25aqpy"
>                         status = ["READ", "WRITE", "VISIBLE"]
>                         segment_count = 1
>
>                         segment1 {
>                                 start_extent = 0
>                                 extent_count = 3840     # 15 Gigabytes
>
>                                 type = "striped"
>                                 stripe_count = 1        # linear
>
>                                 stripes = [
>                                         "pv5", 0
>                                 ]
>                         }
>                 }
>
>                 dvd {
>                         id = "E2VpR0-rfCr-PA4r-Mrtz-50au-2s5T-kGTP5E"
>                         status = ["READ", "WRITE", "VISIBLE"]
>                         segment_count = 1
>
>                         segment1 {
>                                 start_extent = 0
>                                 extent_count = 3840     # 15 Gigabytes
>
>                                 type = "striped"
>                                 stripe_count = 1        # linear
>
>                                 stripes = [
>                                         "pv5", 3840
>                                 ]
>                         }
>                 }
>
>> I talked to someone about this and they said that it could be a kernel
>> device-mapper/user-space device-mapper mismatch issue.  I'm not sure I
>> understand that logic, given that you are able to load other devices 
>> of
>> the same target type (i.e. linear).  Perhaps that person would like to
>> speak up here?
>
> 	Here's a repeat of the version info I posted earlier.  I'm not
> sure if this is reporting kernel or user-space info (or both), and I 
> don't
> see any more version info under /proc/ ...
>
> # lvm version
>   LVM version:     2.02.06 (2006-05-12)
>   Library version: 1.02.07 (2006-05-11)
>   Driver version:  4.4.0
>
>
>> P.S.  Are you always getting the 'cdrom' error?  You may wish to 
>> change
>> the filter option to exclude the cdrom device.  To do that, change the
>> "filter" line in /etc/lvm/lvm.conf to:
>> filter = [ "r|/dev/cdrom|" ]
>
> 	Yes, thanks for that (I recently added a new dvd burner and hadn't
> had a chance to make that change yet).  Speaking of, any chance that 
> such
> a hardware change might have anything to do with this problem?  (It may
> have changed device names for some of the pvs; I don't remember for 
> sure.)
>
> ----------------------
> Matt McHenry
> http://www.speakeasy.org/~jerith/
> jerith@speakeasy.org
> be052@scn.org
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
