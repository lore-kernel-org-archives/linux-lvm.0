From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <20030807151127.GB5036@ti19>
References: <1060247670.28307.37.camel@rocky> <20030807093631.GE381@fib011235813.fsnet.co.uk> <1060260466.4360.2.camel@chtephan.cs.pocnet.net> <20030807134451.GA30494@www.13thfloor.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030807134451.GA30494@www.13thfloor.at>
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Aug  7 10:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Aug 07, 2003 at 03:44:51PM +0200, Herbert P=F6tzl wrote:
> anyway, as pointed out in another response, there is
> no good way, at least none I know of, to find the
> blocks changed since the last backup ...
=20
The DM snapshot target already keeps track of which blocks have
been written.  For incremental backup, we really only need
to know the block numbers.  Why not a new block-meta-data-only
snapshot target that just records block numbers?  That
should have *much* lower overhead and consume insignificant
disk space.

For archival storage, I've lately become enamored of hashed-indexing
as used in Plan 9's Venti (for a single server target) or the various
distributed-hash systems (Chord, etc.) for distributed, replicated
storage.

Regards,

	Bill Rugolsky
