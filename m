Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0VMTS124183
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 17:29:28 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0VMTJvE018887
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 17:29:20 -0500
Date: Tue, 31 Jan 2006 23:29:18 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Mirror with G2U or LVM?
Message-ID: <20060131222918.GG4335@percy.comedia.it>
References: <D3DC8F9206F0D24085E459720ECDF3EDC3F815@mail-18ps.atlarge.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D3DC8F9206F0D24085E459720ECDF3EDC3F815@mail-18ps.atlarge.net>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jan 31, 2006 at 03:52:31PM -0600, Don Shesnicky wrote:
> 
>I'm looking to mirror 2 root drives right down to the MBR so I can 
>boot off either one in the event of a failure. Can this be done with 
>LVM or should I use something like G4U and update during shutdowns. 

i don't know what G2U is and google does not help.
if i were in you i'd read the fine linux-raid HOWTO
http://www.tldp.org/HOWTO/Software-RAID-HOWTO.html

you don't need to mirror the mbr, just be sure to copy it over whenever
you change it. (if you use grub to boot, it never changes, just install
grub on both MBR the first time. If you use lilo there is a 'raid-extra-boot'
configuration command that allows for updating both MBRs)

>I'm using RHEL4 ES.
RHEL4 should support root disk mirror at install time.

>The drives are different sizes 160 gig and a 200 gig is that an issue?
no, but the remaining 40 gig in the biggest disk will not be mirrored.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
