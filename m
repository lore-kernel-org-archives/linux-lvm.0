Return-Path: <lda@winux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14995.59193.714681.826016@nv.winux.com>
Date: Wed, 21 Feb 2001 11:05:13 -0500
From: lvm@winux.com
Subject: Re: [linux-lvm] snapshot of Reiserfs
In-Reply-To: <2090960000.982769673@tiny>
References: <20010221141119.I568@tykepenguin.com>
	<2090960000.982769673@tiny>
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
To: linux-lvm@sistina.com

Chris Mason writes:
> Do you want the patch I send to turn on the VFS_ENHANCEMENT #define in lvm.c?

That seems to make sense.  After all, the purpose of the patch is to
add that support.  Leaving it disabled after applying the patch is
counterintuitive.

Larry
