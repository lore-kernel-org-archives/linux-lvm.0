From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-Id: <20020117115050.GD1066@tykepenguin.com>
References: <200201170225.g0H2P4805926@kebi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200201170225.g0H2P4805926@kebi.com>
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
Date: Thu Jan 17 05:51:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 17, 2002 at 11:25:04AM +0900, Sil Lee wrote:
>    Hi.
> 
>    I Have a problem to use LVM on Sun Sparc 20...
>    when I try to perform a pvcreate a segmentation fault error
>    occur.
> 

Hmmm, it's not getting very far. In fact it's not even getting into pvcreate at
all - that strace output is just getting the shared libraries mapped in and
starting libc.

I'm actually impressed you got that far - I've never managed to get Linux 2.4 to
run successfully on a 32bit SPARC machine.

patrick
