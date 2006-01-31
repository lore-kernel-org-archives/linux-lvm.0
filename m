Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0VMmf130445
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 17:48:41 -0500
Received: from out001.atlarge.net (out001.atlarge.net [129.41.63.69])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0VMmePb020482
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 17:48:40 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 31 Jan 2006 16:48:32 -0600
Message-ID: <D3DC8F9206F0D24085E459720ECDF3EDC3F83F@mail-18ps.atlarge.net>
From: "Don Shesnicky" <don.shesnicky@liquidcomputing.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Mirror with G2U or LVM?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

 
>>I'm looking to mirror 2 root drives right down to the MBR so I can 
>>boot off either one in the event of a failure. Can this be done with 
>>LVM or should I use something like G4U and update during shutdowns. 

>i don't know what G2U is and google does not help.
>if i were in you i'd read the fine linux-raid HOWTO
>http://www.tldp.org/HOWTO/Software-RAID-HOWTO.html

>you don't need to mirror the mbr, just be sure to copy it over whenever
>you change it. (if you use grub to boot, it never changes, just install
>grub on both MBR the first time. If you use lilo there is a
'raid-extra-boot'
>configuration command that allows for updating both MBRs)

G4U is Ghost for Unix, like Windows Ghost but works the way it should
Not with all the hassle that Windows Ghost gives you. Basically boot
Off the cdrom and one command to write a disk image to an ftp server.
Same to reload it to a disk.

Thanks for the info.

Don
