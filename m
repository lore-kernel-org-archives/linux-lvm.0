Return-Path: <bluca@comedia.it>
Date: Sun, 17 Dec 2000 11:04:26 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Patches for 0.8.1
Message-ID: <20001217110426.C9917@colombina.comedia.it>
References: <00121619514201.00774@lyta>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00121619514201.00774@lyta>; from russell@coker.com.au on Sat, Dec 16, 2000 at 07:51:42PM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>  
>  $(SO): $(ALL_OBJECTS)
> -       ld -shared -o $(SO) $(ALL_OBJECTS)
> +       ld -shared -soname=${SO} -o $(SO) $(ALL_OBJECTS)
> +       ln -sf ${SO} ${BASESO}

i thought it was better to use 'gcc -shared -Wl,-soname,${SO}' to link
shared libraries, especially under libc6

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
