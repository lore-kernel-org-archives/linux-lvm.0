Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Re: GRUB + LVM + XFS?
References: <1010427293.29260.3.camel@UberGeek>
    <E16QVJv-0003Zk-00@hermes.sistina.com>
    <20020115153547.GB1022@tykepenguin.com>
In-Reply-To: <20020115153547.GB1022@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16QVxN-0005ie-00@hermes.sistina.com>
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
Date: Tue Jan 15 09:58:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Patrick Caulfield <caulfield@sistina.com>

On Wed, 16 Jan 2002 01:35, Patrick Caulfield wrote:
> Looking at other threads in this list I think the issues are XFS related. I
> have tried the latest XFS patches from
>
> ftp://oss.sgi.com/projects/xfs/download/patches/2.4.17/
>
> and the snapshots seem OK to me (that's without the VFS lock patch which
> XFS doesn't seem to need anyway).
>
> patrick

The actual fix was worked out by Eric of SGI by comparing the Linus tree with 
the LVM code (I hope I have this correct) and it modifies lvm-snap.c - at 
least appears to be an interaction problem.  The weird thing is that this 
fixes the problem if I run my LVM tests by hand - if I use a script it still 
fails.

--- lvm-snap.c	Wed Jan  9 16:10:01 2002
+++ /localhome/eric/lvm-1.0.1-works/lvm-snap.c	Wed Jan  9 16:07:52 2002

http://marc.theaimsgroup.com/?l=linux-xfs&m=101061519711939&w=2

-- 
Adrian Head

(Public Key available on request.)
