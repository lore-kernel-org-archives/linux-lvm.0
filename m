Date: Tue, 2 Oct 2001 15:25:44 +0000
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] segmentation fault problems
Message-ID: <20011002152544.A403@guldukat.muon.local>
References: <3BB94718.30441CCA@adelaide.edu.au> <E15oJws-0004t5-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15oJws-0004t5-00@hermes.sistina.com>
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

On Tue, 02.10.01, Henning Hogue <henning@randomfactor.net> wrote:
> Thanks for the patch to lvcreate, I can now create logical volumes but all the 
> other commands for logical volumes also cause segmentation faults. Are there 
> patches for these too?

As Heinz already suggested, this _might_ be a compiler issue. Are you
using gcc-3.0.x? If yes, try 2.95.x.

Myself, i had problems with 1.0.1-rc2 using gcc-3.0.1. A lot of the
tools would segfault.

good luck,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
