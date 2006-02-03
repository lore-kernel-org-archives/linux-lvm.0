Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k130Z9112932
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 19:35:09 -0500
Received: from monster.flashfabrik.hu (postfix@flashfabrik.hu [195.70.36.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k130Ytj6030745
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 19:34:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by monster.flashfabrik.hu (Postfix) with ESMTP id 75E69277516
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 01:34:48 +0100 (CET)
Received: from monster.flashfabrik.hu ([127.0.0.1])
	by localhost (monster.flashfabrik.hu [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 05545-01 for <linux-lvm@redhat.com>;
	Fri, 3 Feb 2006 01:34:45 +0100 (CET)
Received: from mir.fatav.hu (host-87-242-14-86.prtelecom.hu [87.242.14.86])
	by monster.flashfabrik.hu (Postfix) with ESMTP id C5A3727727E
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 01:34:41 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mir.fatav.hu (Postfix) with ESMTP id 5A6FD371F8
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 01:34:36 +0100 (CET)
Received: from mir.fatav.hu ([127.0.0.1])
	by localhost (mir.fatav.hu [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 12789-07 for <linux-lvm@redhat.com>;
	Fri,  3 Feb 2006 01:33:51 +0100 (CET)
Received: from loon.fatav.hu (loon.fatav.hu [192.168.31.14])
	by mir.fatav.hu (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 01:33:51 +0100 (CET)
Date: Fri, 3 Feb 2006 01:33:44 +0100
From: Szabo Akos <fonya@loon.fatav.hu>
Subject: Re: [linux-lvm] Expanding volume groups to fill a growing disk
Message-ID: <20060203003308.GA20335@loon.fatav.hu>
References: <Pine.LNX.4.64.0602021457070.1276@localhost.localdomain>
	<20060202232526.GU4280@agk.surrey.redhat.com>
	<Pine.LNX.4.64.0602021537310.1276@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0602021537310.1276@localhost.localdomain>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Feb 02, 2006 at 03:40:57PM -0800, Ben wrote:
> What version do I need?

At least I don;t no, but I have tha bleow, BTW I never use it!

/I use fedore FC5T. 
device-mapper-1.02.02-3
lvm2-2.02.01-1.1/

pvresize --help
  pvresize: Resize physical volume(s)

pvresize 
        [-d|--debug]
        [-h|-?|--help] 
        [--setphysicalvolumesize PhysicalVolumeSize[kKmMgGtT]
        [-t|--test] 
        [-v|--verbose] 
        [--version] 
        PhysicalVolume [PhysicalVolume...]

pvresize --version
  LVM version:     2.02.01 (2005-11-23)
  Library version: 1.02.02 (2005-12-02)
  Driver version:  4.5.0


-- 
Ciao:
	Fonya

     Ami�ta NT-t install�ltam a porsz�v�mra, semmi sz�v�s nincs vele.
                PGP key ID F86614E5, GPG key ID 83AD9365
