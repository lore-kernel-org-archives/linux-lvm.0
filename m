Subject: Re: [linux-lvm] Changing Controller and also device names
Message-ID: <20021106133937.GB22411@reti>
References: <20021106142554.N30327@gathering.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021106142554.N30327@gathering.org>
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
Date: Wed Nov  6 07:40:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 06, 2002 at 02:25:54PM +0100, Per Kristiansen wrote:
> Do I need to take SPECIAL care to get the same device names  when I move the disks to the new controller
> or can it find the data it needs using vgscan/pvscan ?

vgscan looks at the UUID on each disk rather than relying on the
device names.  So, no, you don't have to do anything special.

- Joe
