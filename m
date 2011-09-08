Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p88M2sx0028412
	for <linux-lvm@redhat.com>; Thu, 8 Sep 2011 18:02:54 -0400
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p88M2mnc029497
	for <linux-lvm@redhat.com>; Thu, 8 Sep 2011 18:02:49 -0400
Received: by yxp4 with SMTP id 4so1125267yxp.33
	for <linux-lvm@redhat.com>; Thu, 08 Sep 2011 15:02:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <883D98939E388E429EE8D771168A6560027F32CDF3@USCMIMAIL1.corp.amdocs.com>
References: <883D98939E388E429EE8D771168A6560027F32CDF3@USCMIMAIL1.corp.amdocs.com>
Date: Thu, 8 Sep 2011 23:02:48 +0100
Message-ID: <CAOFfa-FNWc0+YXpwE=_YMdewqBuzDFhbENYYnHVuD4op_U8qJA@mail.gmail.com>
From: chrisp <chrisp262@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Got Error 5 while doing vgimportclone without
 exporting the VG
Reply-To: chris@chrisprocter.co.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

So its been ages since I looked at vgimportclone but I think moving
those lines would be bad.

Line 230 gets a list of the current VG names which is then used to
find a name for the imported VG that doesn't conflict with something
that already exists.  You have to get the existing names before you
set the temporary LVM_SYSTEM_DIR because doing that restricts lvm to
only seeing the importing VG (which you need to do to prevent
conflicts while your working on it) so you cant get the VG list once
thats happened.

(well I guess you could move the line but you'll have to be very
certain that the new name you give via -n is unique if not things will
get messy)


I dont quite understand what your actually doing, I'm a netapp guy so
the EMC terminology is a bit alien to me but wether a vg is exported
before the clone shouldn't matter, you should just present in the
clone, find the new device names, and run vgimportclone.

Can you run
vgs -o name --noheadings
normally without errors? what about just before vgimportclone?

chris



On 7 September 2011 16:02, Jewsco Pius Jacquez
<JewscoPius.Jacquez@amdocs.com> wrote:
>
> Hello,
>
>
>
> We have a EMC Storage side mirroring and normally to refresh the copy, we do vgexport, establish, split, then vgimportclone.
>
>
>
> We are facing some issue when refreshing the copy then doing vgimportclone without doing vgexport first.
>
>
>
> I checked the script vgimportclone, I�m wondering if I can move the line 230-231 to line 274 after the temporary LVM_SYSTEM_DIR is exported?
>
> Will this probably fix the issue?
>
>
>
>
>
> I have;
>
> lvm2-2.02.74-5.el5
>
> lvm2-cluster-2.02.74-3.el5
>
> device-mapper-1.02.55-2.el5
>
> Sample screenshots:
>
> + vgimportclone -n VG_NAME -i /dev/mapper/disk1 /dev/mapper/disk2 /dev/mapper/disk3 /dev/mapper/disk4
>
> Fatal: Current VG names could not be collected without errors, error: 5
>
>
> In HPUX this is fine..refreshing without vgexport is fine� Any idea?
>
>
>
>
>
> Thanks,
> Jewsco
>
> This message and the information contained herein is proprietary and confidential and subject to the Amdocs policy statement,
> you may review at http://www.amdocs.com/email_disclaimer.asp
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
