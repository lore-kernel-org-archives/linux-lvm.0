From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030819225130.GA1758@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com> <20030818185719.C29420@uk.sistina.com> <20030818225358.GA1712@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030818225358.GA1712@gondor.com>
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
Date: Tue Aug 19 17:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

Unfortunately I had some network problems today, so the debugging
session was shorter than expected. 

But I did gather another logfile with activation=1.
It's available from http://gondor.com/lvm/lvm2.log.20030819
Additionally, there is a file 'typescript' in the same directory, which
contains output from dmsetup ls and dmsetup -v table vgraid-pvmove0.

Jan
