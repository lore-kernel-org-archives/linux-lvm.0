From: Chris Jantzen <chris-lvm@maybe.net>
Subject: Re: [linux-lvm] Re: mounting reiserfs snaphost fails
Message-ID: <20021004191308.GK11298@maybe.net>
References: <009b01c26ba9$380f3140$5c02a8c0@yckim> <3D9D9C1D.42B8E4C7@silicide.dk> <1033743530.3126.132.camel@saprdlx68> <3D9DBA18.92568359@silicide.dk> <1033749912.2785.138.camel@saprdlx68>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1033749912.2785.138.camel@saprdlx68>
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
Date: Fri Oct  4 14:19:50 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 04, 2002 at 12:45:12PM -0400, Chris Abernethy wrote:
> I was wondering if there was a compelling LVM-related reason to choose
> one over the other for use with LVM.

When I originally evaluated journaled filesystems for use with LVM,
reiser had the best resize support (in both directions). I believe ext3
has caught up in that regard.

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
