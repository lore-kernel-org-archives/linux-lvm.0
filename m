Return-Path: <hmilz@linux-magazin.de>
From: Harald Milz <hmilz@linux-magazin.de>
Subject: Re: [linux-lvm] XFS and LVM 
References: <200105231113.f4NBDLA21032@jen.americas.sgi.com>
Date: Wed, 23 May 2001 14:45:38 +0200 (CEST)
Message-Id: <20010523124542.C43D515CB5@mail.linux-new-media.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In article <200105231113.f4NBDLA21032@jen.americas.sgi.com>, Steve Lord <lord@sgi.com> wrote:

> Shrinking is also a less used operation in production situations than growing,

This what IBM marketing as well always told me (when I was an IBMer) but it
turned out over time that I don't always buy a new disk when I need more
space, but try to clean up some leftovers and resize my partitioning. Then
it's nice if you can shrink. I mean you can always backup a filesystem,
delete it, create it smaller, and restore the backup. But that is
cumbersome and requires more scheduled downtime than desirable. 

Does SGI have plans to eventually implement shrinking, or am I left with
the every so often heard marketing statement that I sure don't need it? 

(SCNR)

-- 
Harald Milz           |     hm@linux-magazin.de     | "Our vision is to speed
Linux Magazin         | phone  +49 (0) 89 993411-20 | up time, eventually
Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | eliminating it." --
D-81929 Muenchen      | http://www.linux-magazin.de | Alex Schure
