Subject: Re: [linux-lvm] How to fix inconsistent LV structs?
References: <004101c26dec$5b58c950$2dbb0044@warl0k>
From: Raffael Herzog <herzog@raffael.ch>
In-Reply-To: <004101c26dec$5b58c950$2dbb0044@warl0k>
Message-ID: <8765weh4wr.fsf@mail.raffael.ch>
MIME-Version: 1.0
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
Date: Mon Oct  7 06:32:13 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Glenn,

Glenn Shannon wrote:

> Was this computer connected to a network when it went down?

Yes. I'm using the 3c95x driver.


> Looks like a stack overflow to me, but where was the originator? Coda?
> Unlikely but possible. Replaced syscalls usually (IIRC) indicate that
> not only did a stack overflow occur but also that registers were
> modified by whatever overflowed the stack.

Coda always replaces Syscalls, AFAIK. At least, it does so
on initialization.


> The kernel is noting itself
> as tainted, which means that some form on non-GPLed module is running
> (or has entered the stack to converse with the kernel directly, acting
> as a module..)

Correct, the nVidia driver taints the kernel.


cu,

   Raffi


-- 
=> Neu im Usenet? Fragen?    http://www.use-net.ch/usenet_intro_de.html <=
  The difference between theory and practice is that in theory, there is
                 no difference, but in practice, there is.
Raffael Herzog - herzog@raffael.ch - http://www.raffael.ch - ICQ #67961355
