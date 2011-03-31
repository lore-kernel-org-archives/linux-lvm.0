From: "Males, Jess" <jmales@cio.sc.gov>
Date: Wed, 30 Mar 2011 20:41:06 -0400
Message-ID: <0A03EDA0F33C5C428BFFF019C40D609E9CB6D0E650@SCMBXC01.bcbad.state.sc.us>
References: <0A03EDA0F33C5C428BFFF019C40D609E9CB74986A8@SCMBXC01.bcbad.state.sc.us>,
	<4D8761A8.1020009@redhat.com>
In-Reply-To: <4D8761A8.1020009@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] vgexport usage
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
To: "akaiser@redhat.com" <akaiser@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Griswold, Doug" <griswld@cio.sc.gov>

Maybe "unknown" is the wrong word in this case. You will be able to
see this VG using vgs, vgdisplay and so on. But you can't remove when
you try a vgremove.

You have to import it back (vgimport VolumeGroup) to change it again.

I think that unknown means more like "unchangeable".

[]'s

--
Anderson Kaiser (RHCE, RHCVA)
Red Hat Brasil - Global Support Services
akaiser@redhat.com
+55 11 3529-6000
Direct: +55 11 3529-6093

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-----

Thanks for the response, Anderson.

the use case I'm imagining is the export of a set of disks from one machine (VG intact) and the subsequent import into another machine.  The command works perfectly in such a scenario.  I can vgexport, yank the disks from one machine, insert into another, scan the scsi bus, vgscan, vgimport, vgchange, mount the lv, and use all my data.  However, after doing all this and going back to the original system that created the VG, not only do I see the VG in vgdisplay or vgs, but I get errors from the missing disk.

And in typing all this up, it occurrs to me to try a vgscan on the original system. <pause>  voila!
I still got disk complaints, but I unlinked /dev/sdb1 and /dev/sdb and now we're clean; no complaints anywhere about previously used disks or VGs.

Thanks,

-- Jess Males
