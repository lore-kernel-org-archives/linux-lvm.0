Return-Path: <zoo1@corecomm.net>
Date: Wed, 10 Jan 2001 19:54:40 -0500
From: zoo1@corecomm.net
Message-ID: <20010110195439.A11865@bar.nowhere>
References: <3A57B052.FA0DFBB2@wrkhors.com> <0101090031381K.05036@lyta> <3A5AAF8C.305C862D@wrkhors.com> <01011001391323.05036@lyta>
Mime-Version: 1.0
In-Reply-To: <01011001391323.05036@lyta>; from russell@coker.com.au on Wed, Jan 10, 2001 at 01:39:13AM +1100
Subject: [linux-lvm] hard drive shock tolerance
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 10, 2001 at 01:39:13AM +1100, Russell Coker wrote:

[...]
>My "gut feeling" is that drives are more susceptible to damage now.  I know 
>of cases of older 3600rpm drives being dropped, being hit by a car while 
>operating (car entered building through the wall of the computer room), and 
>suffering numerous other mechanically damaging events without data loss.  I 
>belive that modern 10K rpm drives are not as solid.

speaking as someone who has personally dropped (and destroyed) 36GB 10K
rpm SSA disk drives, i can attest that modern-day disks are sensitive.
those disks i mentioned fell about 20-30cm onto concrete, and were
toast.

(in all fairness, other identical drives that fell right with them
survived, so that shock must have been just on the boundary. i ended up
avoiding the blame, due to the unreasonable and careless way the disks
had been packaged and shipped - which was lucky for me, genuine IBM
disks of this type cost around $1600 USD apiece...)

hit by a car? you're serious? i can't even imagine a modern disk
surviving that! i've seen 9GB SCSI disks destroyed by an approximately
60cm drop onto wooden benchtop, covered with a (thin) antistatic rubber
mat; that wasn't me dropping those, though - about $800 apiece, IIRC...

>Also drives are more susceptible to heat problems.  3600rpm drives
>could operate with all their air-holes blocked and while surrounded by
>other hard drives without problems.  You can't stack two new 10K rpm
>drives without good fans.

i'll take your word for it. myself, i never see drives like that in
PCs, just in workstations and RAID arrays with more than adequate
cooling; but then again, i don't see PCs much these days anymore.

-- 
   PGP/GnuPG key (ID 1024D/BFE0D6D0) available from keyservers everywhere

       "Everything I am today, I owe to people whom it is now too late
                                   to punish."
