Subject: Re: [evms-devel] [linux-lvm] [ANNOUNCE] LVM reimplementation
    ready for beta testing
In-Reply-To: <02020115304301.00650@boiler> from
    "Kevin Corry"
    at Feb 01, 2002 03:59:06 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E16Wn8K-0006Rf-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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
Date: Fri Feb  1 17:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Kevin Corry <corryk@us.ibm.com>
Cc: Joe Thornber <thornber@fib011235813.fsnet.co.uk>, linux-lvm@sistina.com, evms-devel@lists.sourceforge.net, Jim@mcdee.net, Andreas Dilger <adilger@turbolabs.com>, linux-kernel@vger.kernel.org

> As I'm trying to envision it, the EVMS runtime would become a "volume 
> recognition" framework (see tanget below). Every current EVMS plugin would 

Volume recognition is definitely a user space area. There are a huge array
of things you want to do in some environments that you cannot do from
kernel space

Simple example: We have mount by label, imagine trying to extend that in
kernel space to automatically do LDAP queries to find a remote handle to
the volume and NFS mount it. It's easy in user space.

Alan
