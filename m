Message-ID: <3C06DC9D.5020205@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
References: <Pine.LNX.4.33.0111291548580.4437-100000@lx1.daboard.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu Nov 29 19:09:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

mitch@mdmiller.com wrote:


> Pardon me for being a neophyte here, but what else goes on the root
> partition which takes any significant or dynamic amount of space?  Isn't
> the root just a place to put all the top level directories, the contents
> of which are typically all on another partition anyway?


It largely depends on how you set up your system.

For instance, on most systems I set up, I end up having / and /usr on 
the same filesystem, which means that any RPMS I install end up on the 
root partition.  If you start with a fairly small install and later 
decide to add a bunch of flashy office suites, games, or multimedia 
applications, your storage requirements can change drastically.

-- Lars
