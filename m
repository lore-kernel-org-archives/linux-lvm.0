Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0BHbQr24430
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 12:37:26 -0500
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0BHbOia010211
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 12:37:25 -0500
Received: from flo.18rcarmes.fr (unknown [81.56.213.72])
	by postfix4-2.free.fr (Postfix) with ESMTP id F3A892A0575
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 18:37:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by flo.18rcarmes.fr (Postfix) with ESMTP id 3C47E8EEC
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 18:37:18 +0100 (CET)
Received: from flo.18rcarmes.fr ([127.0.0.1])
	by localhost (flo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 18912-02 for <linux-lvm@redhat.com>;
	Tue, 11 Jan 2005 18:37:05 +0100 (CET)
Received: from marco (marco.18rcarmes.fr [192.168.0.1])
	by flo.18rcarmes.fr (Postfix) with ESMTP id 11D948D0D
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 18:37:05 +0100 (CET)
From: Marc Cousin <cousinmarc@free.fr>
Subject: Re: [linux-lvm] scary message (incorrect header checksum)
Date: Tue, 11 Jan 2005 18:37:04 +0100
References: <200501102144.34198.cousinmarc@free.fr>
	<20050111142116.GT26670@agk.surrey.redhat.com>
In-Reply-To: <20050111142116.GT26670@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501111837.04303.cousinmarc@free.fr>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

        /dev/ram2: Skipping: Unrecognised LVM device type 1
        Opened /dev/hda2 RO
      /dev/hda2: size is 1012095 sectors
        Closed /dev/hda2
        Using /dev/hda2
        Opened /dev/hda2 RO
        /dev/hda2: block size is 4096 bytes
      /dev/hda2: lvm2 label detected
        Closed /dev/hda2
        Opened /dev/hda2 RO
        /dev/hda2: block size is 4096 bytes
  Incorrect metadata area header checksum
        Closed /dev/hda2
        /dev/loop2: Skipping (sysfs)
        /dev/sda2: Skipping (sysfs)
        /dev/md2: Skipping (sysfs)
        /dev/scd2: Skipping (sysfs)
        /dev/xda2: Skipping (sysfs)
        /dev/hdc2: Skipping (sysfs)
        /dev/sbpcd2: Skipping (sysfs)
        /dev/hde2: Skipping (sysfs)
        /dev/hdg2: Skipping (sysfs)
        /dev/eda2: Skipping (sysfs)

That's strange, as hda2 is a swap device ...
I've mkswapped it, didn't change a thing.
Si I zeroed it with dd, mkswapped it again, and the message is gone...



On Tuesday 11 January 2005 15:21, Alasdair G Kergon wrote:
> On Mon, Jan 10, 2005 at 09:44:34PM +0100, Marc Cousin wrote:
> > flo:~# vgscan
> >   Reading all physical volumes.  This may take a while...
> >   Incorrect metadata area header checksum
> >   Found volume group "data" using metadata type lvm2
> >
> > It doesn't seem to be a problem, as the lvms are working correctly, but
> > I'd like to get rid of this warning...
> > How can I do this ?
>
> The message might come from a volume that is not part of your
> volume group.
>
> Add '-vvvv' for debugging information to see what is causing the
> message.
>
> Alasdair

-- 
BOFH Excuse #1:

clock speed
