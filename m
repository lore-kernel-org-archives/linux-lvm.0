Return-Path: <grothe@mathematik.tu-darmstadt.de>
From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Message-Id: <200101190212.AA125380352@fb0442.mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] is this patch still needed?
Date: Fri, 19 Jan 2001 3:12:31 MEZ
In-Reply-To: <20010118195339.A20806@jhereg.dmeyer.net>; from "dmeyer@dmeyer.net" at Jan 19, 101 2:12 am
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

Hi,
> 
> I've been running with the following patch, which doesn't seem to have
> made it into 0.9.1-beta[12].  Is it still needed?  With 0.9, it fixed
> what seemed to be a fairly serious problem.
> 
[patch deleted]

The patch isn't needed for 0.9.1-beta2. Beta2 includes a "cleaner"
fix from Heinz for this problem (see line ~190ff of pv_read_all_pv_of_vg.c
beginning with comment /* Correct PV sort order */)

Holger
--
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
