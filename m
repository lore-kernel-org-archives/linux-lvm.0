From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Message-ID: <20030527100801.GB646@fib011235813.fsnet.co.uk>
References: <3ED32F3E.9000009@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ED32F3E.9000009@silicide.dk>
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
Date: Tue May 27 05:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 27, 2003 at 11:26:22AM +0200, Jon Bendtsen wrote:
> Hi there, i'm looking for documentation for the device mapper/lvm2 in 
> the linux 2.5/6 kernel.

i) Enable dm in the kernel config.
ii) Install libdevmapper from the latest device-mapper release at www.sistina.com
iii) Install LVM2 tools.

There is more documentation in the device-mapper and LVM2 packages.

- Joe
