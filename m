From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] crash during metadata operations
Message-ID: <20030507091938.GA440@fib011235813.fsnet.co.uk>
References: <000801c3146b$31318150$09fea8c0@nimiak>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000801c3146b$31318150$09fea8c0@nimiak>
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
Date: Wed May  7 04:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 07, 2003 at 12:35:05AM -0700, Kai-Min Sung wrote:
> I can see a way of guaranteeing atomicity by
> maintaining two VGDA sections and including a timestamp at the end of
> each write. Does LVM do something like this?

The format 2 metadata does indeed use a scheme like this.  If you use
format1 metadata with LVM2 (i.e. just upgrade your tools from LVM1
without subsequently upgrading your metadata), you will not have this
crucial protection.

- Joe
