Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 21 Feb 2001 08:59:59 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <20010221085959.C568@tykepenguin.com>
References: <20010220224907.D21281@srv.sistina.com> <14995.16871.694699.166774@nv.winux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14995.16871.694699.166774@nv.winux.com>; from lvm@winux.com on Tue, Feb 20, 2001 at 11:19:51PM -0500
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

On Tue, Feb 20, 2001 at 11:19:51PM -0500, lvm@winux.com wrote:
> Heinz J. Mauelshagen writes:
> > ... Linux Logical Volume Manager 0.9.1 Beta 5 is available now ...
> > ...
> > Please help us to stabilize for 0.9.1 ASAP and test is as much as possible!
> 
> I am using LVM 0.9.1 beta 5 on Linux 2.4.1 with Reiserfs.
> I have applied both of the following patches:
> 
> 0.9.1_beta5/PATCHES/lvm-0.9.1_beta5-2.4.1.patch
> 0.9.1_beta5/PATCHES/linux-2.4.1-VFS-lock.patch
> 
> Snapshots created when the filesystem is active cannot be mounted.
> If I `umount' the filesystem before creating the snapshot, all is well.

Did you remember to uncomment LVM_VFS_ENHANCEMENT in lvm.c ?

patrick
