Return-Path: <lembark@wrkhors.com>
Date: Wed, 18 Jul 2001 11:58:22 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <473510000.995475502@dizzy>
In-Reply-To: <20010718091639.B382@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643418@AUSMAIL>   <20010717174008.A1000@btconnect.com> <20010717122318.A20564@d3.front>
 <20010718091639.B382@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

- Joe Thornber <thornber@btconnect.com> on 07/18/01 09:16:39 +0100:


>> >    Should we restrict stripes sets to powers of 2 ?

Anything else can (a) lead to performance degredation  and/or
(b) serious bugs dealing with a fairly offball case.  

Especially due to (b) I'd bow down at the alter of KISS.
