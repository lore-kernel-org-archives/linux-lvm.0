From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] pvmove
Message-ID: <20030712132815.GA369@fib011235813.fsnet.co.uk>
References: <1057961544.9804.31.camel@hugo>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1057961544.9804.31.camel@hugo>
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
Date: Sat Jul 12 08:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 11, 2003 at 07:12:26PM -0300, Juan Pablo Gim?nez wrote:
> What's more secure, the Redhat patched pvmove or the original one?

The origininal pvmove has some serious problems that can make it
deadlock.  Redhats version attempts to correct these.

The most recent LVM2 tools (see Alasdairs recent email) contain a
pvmove implementation as well.

- Joe
