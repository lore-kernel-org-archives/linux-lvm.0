Return-Path: <misiek@pld.ORG.PL>
Date: Sun, 6 May 2001 16:55:22 +0200
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Subject: Re: [linux-lvm] lvm on alpha/sparc
Message-ID: <20010506165522.A14022@ikar.t17.ds.pwr.wroc.pl>
References: <20010502012851.A4517@ikar.t17.ds.pwr.wroc.pl> <20010502083511.B638@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010502083511.B638@tykepenguin.com>; from caulfield@sistina.com on Wed, May 02, 2001 at 08:35:11AM +0100
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On/Dnia Wed, May 02, 2001 at 08:35:11AM +0100, Patrick Caulfield wrote/napisa�(a)
> Hmmm funny that. There was an ifdef __sparc__ in there originally which I
> removed because it broke the ultraSPARC compilation. Then I wen to compile for
> my 32bit SPARCstartion IPC and it was needed again :-(

> Just for reference - what kind of SPARC system is it you are using ?

cpu		: TI UltraSparc I   (SpitFire)
fpu		: UltraSparc I integrated FPU
promlib		: Version 3 Revision 11
prom		: 3.11.1
type		: sun4u

kernel headers 2.2.18

> patrick

-- 
Arkadiusz Mi�kiewicz, AM2-6BONE    [ PLD GNU/Linux IPv6 ]
http://www.t17.ds.pwr.wroc.pl/~misiek/ipv6/   [ enabled ]
