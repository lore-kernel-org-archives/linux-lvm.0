From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Can't install LVM 1.0.7 on Redhat Advanced Server 2.1 Please help.
Message-ID: <20030910131406.GB10632@percy.comedia.it>
References: <20030910114840.13991.qmail@web42002.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030910114840.13991.qmail@web42002.mail.yahoo.com>
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
Date: Wed Sep 10 08:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 10, 2003 at 04:48:40AM -0700, Gene wrote:
>I run the ./configure --with-kernel_dir=/boot    
>command, as I could not find a /usr/src/linux
>directory.. (There are no directories under /usr/src)
install the kernel-source rpm

>Does anyone know where the kernel_dir for RH AS is? I
>would think it's in the /boot folder.
/usr/src/linux, if you install the rpm.
but you will soon discover that lvm 1.0.7 patches won't apply cleanly
to the redhat patched kernel, and running a RHAS with a vanilla kernel
is kinda silly.
so, either you are prepared to fix the build by hand, or you wait for
RHAS 3.0

regards,
L.
no, i don't have a RHAS handy anymore, so cannot give you a proper
patch, besides i am not at all interested in lvm 1 since lvm 2
rocks.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
