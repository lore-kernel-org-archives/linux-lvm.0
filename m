Subject: Re: [linux-lvm] LVM2 and Kernel 2.5.xx
Message-ID: <20021007083221.GA1016@fib011235813.fsnet.co.uk>
References: <200210070638.PPL01042@vmms4.verisignmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200210070638.PPL01042@vmms4.verisignmail.com>
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
Date: Mon Oct  7 03:38:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 06, 2002 at 11:38:26PM -0700, david@lownoisefloor.com wrote:
> To anyone who might listen...
> 
> I get this error:
> 
> lvm.c:1: #error Broken until maintainers will sanitize kdev_t 
> handling.
> ---end error---
> Based on a note from Linus about new kdev_t... it looks like 
> this is still under construction...
> 
> Can someone tell me which 2.5.xx kernel is currently working 
> with LVM... so I dont have to download everyone and try each 
> one... 

The plan is to replace the LVM1 driver with device-mapper very shortly.

- Joe
