Subject: Re: [linux-lvm] (no subject)
Message-ID: <20020522121856.GA1904@fib011235813.fsnet.co.uk>
References: <20020522115453.1552.qmail@sina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020522115453.1552.qmail@sina.com>
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
Date: Wed May 22 07:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 22, 2002 at 07:54:53PM +0800, lysindybear wrote:
> I am modifying the lvm source file,I want to make lvm as module instead into kernel,but the compiler tell me something wrong,can 
> someboby tell me what I should modify in the source file? thanks

Just change the LVM option in the kernel to build as a module.  No
need to change source.

- Joe
