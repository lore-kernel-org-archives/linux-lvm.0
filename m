From: Daniel Sully <daniel@electricrain.com>
Subject: Re: [linux-lvm] lvm snapshot fails
Message-Id: <20020109233417.GI30764@electricrain.com>
References: <20020109224112.GG30764@electricrain.com>
    <20020109163009.A769@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020109163009.A769@lynx.adilger.int>
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
Date: Wed Jan  9 17:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Once upon a time Andreas Dilger shaped the electrons to say...

> This is a kernel problem, added since 2.4.10, and fixed in 2.4.18-pre1.
> You need to log into this system directly as root (no "su" or "sudo")
> because it seems you are trying to set a ulimit somewhere, and the
> kernel also prevents you from setting a real ulimit with glibc-2.1.

Thanks. That fixed the problem.

-D
--
Cracking toast Gromit!
