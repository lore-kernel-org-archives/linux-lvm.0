From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] lvcreate seg faults in 1.0.1-r4
Message-ID: <20011125191225.A4404@guldukat.muon.local>
References: <002301c1755e$964da0d0$1a00000a@isdesign.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002301c1755e$964da0d0$1a00000a@isdesign.com>
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
Date: Sun Nov 25 12:10:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Tim,

On Sat, 24.11.01, Tim Nichols <tnichols@Is-design.com> wrote:
> I am having trouble getting lvcreate to work.  I've been able to
> create the PV and VG, but lvcreate always core dumps with a seg
> fault.  I've confirmed that I have the same code level in the kernel
> and tools (1.0.1-rc4).  I've tried compiling the tools with gcc
> (v2.96) and egcs (v2.91.66), but both fail.  I'm running a 2.4.14

try to compile the lvm userspace utilities without opimisation (-O0).

good luck

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
