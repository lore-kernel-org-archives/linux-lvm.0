Subject: Re: [linux-lvm] Limits
References: <695771C76AEED411A19800902771A5040158B633@NC10S106>
	<2160656500.20020927230655@tnonline.net>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Anders Widman's message of "Fri, 27 Sep 2002 23:06:55 +0200"
Message-ID: <ufad6qzaybx.fsf@epithumia.math.uh.edu>
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
Date: Fri Sep 27 17:03:51 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "AW" == Anders Widman <andewid@tnonline.net> writes:

AW> I thought this limitation (2TB) would be removed in newer kernels,
AW> or am I mistaken?

There are patches (by Peter Chubb) for eliminating the 2TB block
device limit on 32-bit x86 systems.  I do not believe that they have
made it in yet.  They carry a performance penalty and thus are
controllable at compile time by a configuration option.

 - J<
