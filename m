Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB79fVv8024503
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 04:41:31 -0500
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB79fHwe001966
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 04:41:22 -0500
Date: Tue, 7 Dec 2010 10:41:12 +0100 (CET)
From: georges.giralt@free.fr
Message-ID: <444802660.3510791291714872820.JavaMail.root@zimbra44-e7.priv.proxad.net>
In-Reply-To: <1728359014.3510561291714776589.JavaMail.root@zimbra44-e7.priv.proxad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] A hint on a process
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
Content-Type: text/plain; charset="utf-8"
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>

Hello !
Thank you both for your answer.
Marek, I've checked the grow mdadm option.
Here is what the manpage said about it :
       "Normally  when  an array is built the "size" it taken from the smallest
       of the drives.  If all the small drives in an  arrays  are,  one  at  a
       time,  removed  and replaced with larger drives, then you could have an
       array of  large  drives  with  only  a  small  amount  used.   In  this
       situation,  changing  the  "size" with "GROW" mode will allow the extra
       space to start being used.  If the size is increased  in  this  way,  a
       "resync" process will start to make sure the new parts of the array are
       synchronised.

       Note that when an array changes size, any file system that may be stored
       in  the  array  will  not  automatically  grow  to  use the space.  The
       filesystem will need to be explicitly told to use the extra space."
So if my kernel revision support it, I should change one disc at a time, with the 2 bigger disks,
wait for synchronization after every change, then ask the array to grow to reach the disks boundaries (I'll make the second partition up to the physical end of the disk).
If everything works, I just have to pvresize the above PV to get the extra space available...
If something goes south, I will still have the original 160GB disk available to start again, I hope (I do not know what exactly does the mdadm --fail command on the actual disk and data...).
I would greatly appreciate a comment from a person actually having dealt with such issues ;-)
I know I'm some sort of a coward here..... But I would not like loosing data ~:-)
Thanks !
----- Mail Original -----
De: "Marek Podmaka" <marki@marki-online.net>
À: "LVM general discussion and development" <linux-lvm@redhat.com>
Envoyé: Mardi 7 Décembre 2010 08h31:34 GMT +01:00 Amsterdam / Berlin / Berne / Rome / Stockholm / Vienne
Objet: Re: [linux-lvm] A hint on a process

Hello,

Tuesday, December 7, 2010, 2:13:35, Stuart D Gathman wrote:

> Your method will fail because the raid superblock is at the end of the
> partition.

I think it should be possible - just create bigger partition on the
bigger drive, synchronize, replace 2nd drive (also with bigger
partition), synchronize and then use mdadm --grow, which should grow
the md1 device to the full partition size. Then pvresize to resize the
PV inside VG and use can use the extra space.

-- 
  bYE, Marki


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
