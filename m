From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm]  read-only media in a LVM?
Message-ID: <20030616135102.GF11280@fib011235813.fsnet.co.uk>
References: <C42D120999B1CC4C886B6BB2832F356019BF6D@hermes.genomatica.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C42D120999B1CC4C886B6BB2832F356019BF6D@hermes.genomatica.com>
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
Date: Mon Jun 16 08:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 13, 2003 at 04:55:40PM -0700, Sean P. Kane wrote:
> I saw this email below and was wondering if this is supported in both dm
> and the LVM2 tools now.

The tools still don't support this, so you'll have to use dmsetup to
create a writeable snapshot of the CD.  Also be aware that you'll need
to have a suitable fs on the CD, most CD filesystems are read only.

- Joe
