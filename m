Return-Path: <Holger.Rauch@heitec.de>
Date: Fri, 2 Feb 2001 11:34:35 +0100 (CET)
From: Holger Rauch <Holger.Rauch@heitec.de>
Subject: Re: [linux-lvm] Maximum # of PEs Per PV
In-Reply-To: <20010131222537.B24922@wookimus.net>
Message-ID: <Pine.LNX.4.21.0102021133080.15143-100000@miami.datech2.er.heitec.net>
MIME-Version: 1.0
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

Hi!

On Wed, 31 Jan 2001, ^chewie wrote:

> Why didn't you just use the whole disk partitionless?  Zero out the
> first 512b and do a pvcreate on /dev/hdf, /dev/hdg, /dev/hdh.

Thanks a lot for this hint, but what's the advantage compared to creating
a partition of type 8e?

Greetings,

	Holger
