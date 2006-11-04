Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA42RB18019336
	for <linux-lvm@redhat.com>; Fri, 3 Nov 2006 21:27:11 -0500
Received: from mail5.sea5.speakeasy.net (mail5.sea5.speakeasy.net
	[69.17.117.7])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kA42R9UM030979
	for <linux-lvm@redhat.com>; Fri, 3 Nov 2006 21:27:09 -0500
Received: from dsl093-060-083.pit1.dsl.speakeasy.net (HELO [192.168.0.5])
	([66.93.60.83]) (envelope-sender <jerith@speakeasy.org>)
	by mail5.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-lvm@redhat.com>; 4 Nov 2006 02:27:03 -0000
Date: Fri, 3 Nov 2006 21:27:00 -0500 (EST)
From: Matt McHenry <jerith@speakeasy.org>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
In-Reply-To: <172c1cd542e581bc25f1bfb25e7b819a@redhat.com>
Message-ID: <Pine.LNX.4.64.0611032113550.5594@localhost>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<2e9d2be4483db00be84afd0aca33e698@redhat.com>
	<Pine.LNX.4.64.0610302250450.19176@localhost>
	<9a4fd1bc1dee8da54e868d07f107b3b3@redhat.com>
	<Pine.LNX.4.58.0611011953150.32134@shell2.speakeasy.net>
	<172c1cd542e581bc25f1bfb25e7b819a@redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


 	Thanks for your continued help.  It's still not working, though. 
I ran 'dmsetup remove maingroup-dvd' and 'lvremove maingroup/dvd' and 
rebooted.  It looks like it worked:

# dmsetup table
maingroup-tmp: 0 4194304 linear 8:8 154018176
maingroup-c--p: 0 8388608 linear 8:7 47980928
maingroup-capture: 0 23642112 linear 8:7 56369536
maingroup-capture: 23642112 40009728 linear 8:6 384
maingroup-capture: 63651840 78954496 linear 8:10 384
maingroup-usr: 0 19996672 linear 8:9 73400704
maingroup-usr: 19996672 974848 linear 8:8 150946176
maingroup-usr: 20971520 3891200 linear 8:8 48619904
maingroup-usr: 24862720 7708672 linear 8:8 384
maingroup-usr: 32571392 9371648 linear 8:8 52511104
maingroup-var: 0 10485760 linear 8:9 62914944
maingroup-var: 10485760 5218304 linear 8:8 145727872
maingroup-gen--website: 0 31457280 linear 8:11 384
maingroup-music: 0 1810432 linear 8:8 158212480
maingroup-music: 1810432 17317888 linear 8:9 142705024
maingroup-music: 19128320 43786240 linear 8:7 384
maingroup-swap2: 0 2097152 linear 8:7 45883776
maingroup-opt: 0 2097152 linear 8:8 151921024
maingroup-opt: 2097152 6291456 linear 8:8 42328448
maingroup-swap1: 0 2097152 linear 8:7 43786624
maingroup-home: 0 62914560 linear 8:9 384
maingroup-home: 62914560 29310976 linear 8:9 113394048
maingroup-home: 92225536 19996672 linear 8:9 93397376
maingroup-home: 112222208 34619392 linear 8:8 7709056
maingroup-home: 146841600 83845120 linear 8:8 61882752

 	But lvcreate still fails:

# lvcreate -L 15G -n dvd maingroup
   /dev/cdrom: open failed: Read-only file system
   Attempt to close device '/dev/cdrom' which is not open.
   device-mapper: reload ioctl failed: Invalid argument
   Failed to activate new LV.

 	(note that I have made the suggested change to /etc/lvm/lvm.conf 
and am still getting those /dev/cdrom errors)

On Thu, 2 Nov 2006, Jonathan E Brassow wrote:

> If linux reorders your devices, it won't affect LVM.
>
> The two logical volumes you mentioned do not overlap.  The important thing to 
> look at there is the "stripes" section.  You can see that 'gen-website' lives 
> on 'pv5' (i.e. the 5th physical volume in the volume group) and that it 
> starts at extent '0'.  'dvd' also lives on 'pv5', but it starts at extent 
> 3840 - directly after 'gen-website'.
>
> So, you are ok to do the lvremove maingroup/dvd.
>
> brassow
>
> P.S.  If you accidentally did a 'lvremove -ff <vg>' and wiped out all your 
> volumes, there is no need to panic.  You can simply use 'vgcfgrestore' to 
> bring them back.  Most mistakes in LVM2 are reversible, which is nice.  :)
>
> On Nov 1, 2006, at 7:07 PM, Matt McHenry wrote:
>
>>  On Wed, 1 Nov 2006, Jonathan E Brassow wrote:
>> 
>> >  You can certainly try an 'lvremove maingroup/dvd'.  It seems to me that
>> >  the logical volume is in the metadata (you can look for it in
>> >  /etc/lvm/backup/maingroup), but for some reason it is not able to
>> >  complete the load of that device into device-mapper.  Because it only
>> >  partially succeeds, it is giving you a device with no table...  After
>> >  doing the 'lvremove' you may need to also do a 'dmsetup remove
>> >  maingroup-dvd'.  Once completely removed, you could try your 'lvcreate'
>> >  again.
>>
>>  	I took a look in /etc/lvm/backup/maingroup.  Again keeping in mind
>>  that I don't know much about LVM, it looks to me like the 'gen-website'
>>  and 'dvd' LVs are overlapping somehow.  Assuming that's correct, I'm still
>>  reluctant to try any 'remove' commands because I don't want to destroy the
>>  data on the gen-website LV.  So once again I'll await further replies. 
>> :) 
>>
>>                  gen-website {
>>                          id = "GhsR38-lmVZ-5gyN-fbt3-RWJv-f9rF-25aqpy"
>>                          status = ["READ", "WRITE", "VISIBLE"]
>>                          segment_count = 1
>>
>>                          segment1 {
>>                                  start_extent = 0
>>                                  extent_count = 3840     # 15 Gigabytes
>>
>>                                  type = "striped"
>>                                  stripe_count = 1        # linear
>>
>>                                  stripes = [
>>                                          "pv5", 0
>> ]
>>                          }
>>                  }
>>
>>                  dvd {
>>                          id = "E2VpR0-rfCr-PA4r-Mrtz-50au-2s5T-kGTP5E"
>>                          status = ["READ", "WRITE", "VISIBLE"]
>>                          segment_count = 1
>>
>>                          segment1 {
>>                                  start_extent = 0
>>                                  extent_count = 3840     # 15 Gigabytes
>>
>>                                  type = "striped"
>>                                  stripe_count = 1        # linear
>>
>>                                  stripes = [
>>                                          "pv5", 3840
>> ]
>>                          }
>>                  }
>> 
>> >  I talked to someone about this and they said that it could be a kernel
>> >  device-mapper/user-space device-mapper mismatch issue.  I'm not sure I
>> >  understand that logic, given that you are able to load other devices of
>> >  the same target type (i.e. linear).  Perhaps that person would like to
>> >  speak up here?
>>
>>  	Here's a repeat of the version info I posted earlier.  I'm not
>>  sure if this is reporting kernel or user-space info (or both), and I don't
>>  see any more version info under /proc/ ...
>>
>>  # lvm version
>>    LVM version:     2.02.06 (2006-05-12)
>>    Library version: 1.02.07 (2006-05-11)
>>    Driver version:  4.4.0
>> 
>> 
>> >  P.S.  Are you always getting the 'cdrom' error?  You may wish to change
>> >  the filter option to exclude the cdrom device.  To do that, change the
>> >  "filter" line in /etc/lvm/lvm.conf to:
>> >  filter = [ "r|/dev/cdrom|" ]
>>
>>  	Yes, thanks for that (I recently added a new dvd burner and hadn't
>>  had a chance to make that change yet).  Speaking of, any chance that such
>>  a hardware change might have anything to do with this problem?  (It may
>>  have changed device names for some of the pvs; I don't remember for sure.)
>>
>>  ----------------------
>>  Matt McHenry
>>  http://www.speakeasy.org/~jerith/
>>  jerith@speakeasy.org
>>  be052@scn.org
>>
>>  _______________________________________________
>>  linux-lvm mailing list
>>  linux-lvm@redhat.com
>>  https://www.redhat.com/mailman/listinfo/linux-lvm
>>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

----------------------
Matt McHenry
http://www.speakeasy.org/~jerith/
jerith@speakeasy.org
be052@scn.org
