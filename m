Return-Path: <juergens@muon.de>
Date: Wed, 31 Jan 2001 18:48:52 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Maximum # of PEs Per PV
Message-ID: <20010131184852.A1268@guldukat.muon>
References: <Pine.LNX.4.21.0101311816020.13129-100000@miami.datech2.er.heitec.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0101311816020.13129-100000@miami.datech2.er.heitec.net>; from Holger.Rauch@heitec.de on Wed, Jan 31, 2001 at 06:30:37PM +0100
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

On Wed, 31.01.01, Holger Rauch <Holger.Rauch@heitec.de> wrote:

[snip]

> Now, I've got a few questions:
> 1. Why do I only have 229GB available on this volume group instead of
> 240G?

Well, the problem here is that harddisk vendors sell disks that have a
capacity of 80 * 1000 * 1000 kB but name this 80GB, which is 80 * 1024
* 1024 kB.

So your three disks have 3 * 80 * 1000^2 / (1024^2) = 228.88 

So your only have 229 GB total capacity and LVM is quite correct :)

greetings,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
