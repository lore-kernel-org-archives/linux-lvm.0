Return-Path: <wichert@cistron.nl>
Date: Fri, 20 Apr 2001 12:36:24 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] LVM and DRDB
Message-ID: <20010420123624.F13067@cistron.nl>
References: <20010420111022.C6133@cistron.nl> <200104201031.f3KAVT05030575@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104201031.f3KAVT05030575@webber.adilger.int>; from adilger@turbolinux.com on Fri, Apr 20, 2001 at 04:31:29AM -0600
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
To: linux-lvm@sistina.com, linux-openlvm@nl.linux.org

Previously Andreas Dilger wrote:
> Hopefully you have some sort of journaled filesystem for this?

Either ext3 or reiserfs, depending on the kernel we use. Doing a
fsck on 5TB of data is not something I would enjoy doing :)

Wichert.

-- 
   ________________________________________________________________
 / Generally uninteresting signature - ignore at your convenience  \
| wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
