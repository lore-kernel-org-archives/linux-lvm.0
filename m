Return-Path: <bs@infologic.fr>
Message-ID: <3A950C2C.9D6E8737@infologic.fr>
Date: Thu, 22 Feb 2001 13:55:09 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] online resize of ext2
References: <200102211725.f1LHPPv31859@webber.adilger.net>
Content-Transfer-Encoding: 7bit
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


Andreas Dilger wrote:

> Because the code is only used at resize time it does not affect normal
> operations, so it is OK to put into a production kernel, IMHO (although
> being the author makes me a bit biased ;-).  Any other ext2online users
> out there?

I use it on a test system, and I made a big amount of resize without any
loss of data.
Really good.
Since I didn't have any production system runnig with Linux, I can't say
if it is stable enough sorry.

Just after the release of 2.4.0 kernel, I patched it with the patch for
2.3.99 kernels and everything worked perfectly.

I only get a few rejects on Config.in, but I inserted it by hand.
