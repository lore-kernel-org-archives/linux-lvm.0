Return-Path: <riel@conectiva.com.br>
Date: Wed, 3 Jan 2001 20:56:55 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Message-ID: <Pine.LNX.4.21.0101032054040.1917-100000@duckman.distro.conectiva>
MIME-Version: 1.0
Subject: [linux-lvm] LVM 0.9 vgscan problem
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-kernel@vger.kernel.org

Hi,

I have a strange problem (preventing me from testing the latest
2.4 kernel ... *sigh*) with my LVM setup.

The latest LVM utils + the latest kernel works just fine on my
test machine, but breaks horribly on my workstation. The only
difference I have found is that one PV of my VG has "NOT available"
as PV Status ...

--- Physical volume ---
PV Name               /dev/hda5
VG Name               vg0
PV Size               4.4 GB / NOT usable 2.56 MB [LVM: 124 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              1125
Free PE               1125
Allocated PE          0

Any chance of getting the LVM utilities fixed ?

I'd hate to see LVM be the showstopper for 2.4
(then again, the way the LVM team has neglected
everything from backwards compatability to even
documenting such is pretty much a showstopper in
itself ...)

regards,

Rik
--
Hollywood goes for world dumbination,
	Trailer at 11.

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com.br/
