Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1MKtci05462
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 15:55:38 -0500
Received: from Woody.fw.matav.hu (matav-1.matav.hu [145.236.241.98])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1MKtbb01780
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 15:55:37 -0500
From: =?iso-8859-2?B?TWFnb3PhbnlpIMFycOFk?= <mag@bunuel.tii.matav.hu>
Subject: Re: [linux-lvm] LVM startup takes too long
Message-ID: <20040222204714.GC9010@bunuel.tii.matav.hu>
References: <2F75AEE4E86FDE44BF97709D289BAA7C719649@vega.voltaire.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C719649@vega.voltaire.com>
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 22 15:54:12 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi!

Maybe you have too much device inodes to check but otherwise
uninteresting? In this case it is not proportional to the
amount of your storage.

The solution to this is either filter what you scan, or if you
can, you can try to either rm unnecessary files from /dev,
or tell your *scan programs to look at a different directory,
and polupate it only with the needed devices. At the worst
case you can do it by editing the path in the source and recompile.

A levelez�m azt hiszi, hogy Dan Bar Dov a k�vetkez�eket �rta:
> When I start up our system, I have a startup script that runs pvscan, vgscan
> and lvscan, and parses their output.
> 
> This takes too long - with a small SAN - 1x6 disks FC jbod + 2 FC RAID
> controllers, it takes roughly 45 seconds with pvscan and vgscan about 23
> seconds each.
> 
> Its pretty obvious that with more storage it will take longer.
> 
> Any ideas how can I speed it up? 
> (can I run vgscan/pvscan in parallel ?, can I get all the data I need from a
> single scan ?)
> 
> Thanks
> Dan
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
GNU GPL: csak tiszta forr�sb�l
