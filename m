Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Tue, 27 Feb 2001 16:58:19 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Problem mounting ext2 fs on LVM
Message-ID: <20010227165819.B2215@66bassett.freeserve.co.uk>
References: <m24rxg2lqi.fsf@isnogud.escape.de> <20010227070957.X1611@jadzia.josv.com> <m21ysk2jec.fsf@isnogud.escape.de> <20010227082155.B1611@jadzia.josv.com>
Mime-Version: 1.0
In-Reply-To: <20010227082155.B1611@jadzia.josv.com>; from josv@osp.nl on Tue, Feb 27, 2001 at 08:21:55AM -0800
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

On Tue, Feb 27, 2001 at 08:21:55AM -0800, Jos Visser wrote:
> Thus far, I have been too lazy to dive into the code. However, what I
> had not found out, and what is an important clue I guess, is that it
> *does* work with a 4KB block size.

This is a known bug (look in KNOWN_BUGS).  I'm not sure where the
persistent value is.

- Joe
