Subject: Re: [linux-lvm] IBM's LVM?
Message-ID: <20020813080434.GB1048@fib011235813.fsnet.co.uk>
References: <Pine.LNX.4.30.0208130910260.5532-100000@duplo.agenda.si>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0208130910260.5532-100000@duplo.agenda.si>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Tue Aug 13 03:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 13, 2002 at 09:24:11AM +0200, Danilo Godec wrote:
> Hi!
> 
> There seems to be a new(?) Linux LVM implementation by IBM
> (http://evms.sourceforge.net/).
> 
> Is this a really different implementation or is it just the tools, GUIs
> and stuff around the current kernel LVM?

This isn't that new, though I think it only hit version 1.0 in the
last 6 months.  It is a totally different implementation, with some
features that LVM1 doesn't have.  LVM2 has a somewhat different
design philosophy from them, trying to minimise kernel code.

- Joe
