From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Which  meta-data format to use with lvm2?
Message-ID: <20030722143525.GM14756@fib011235813.fsnet.co.uk>
References: <200307221302.18609.krienke@uni-koblenz.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200307221302.18609.krienke@uni-koblenz.de>
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
Date: Tue Jul 22 09:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 22, 2003 at 01:02:14PM +0200, Rainer Krienke wrote:
> I have one simple decision problem: What metadata format should I use? lvm1 or 
> lvm2. I did not find much info about the advantages and stability of format 
> lvm2. The lvm man pages says that lvm2 is better and more resilient, so 
> should I use it or better stay with lvm1. 

The LVM2 format is vastly superior to format1.  Everyone who is
setting up a new system is advised to use format 2.

- Joe
