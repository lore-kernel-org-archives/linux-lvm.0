From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] char/block raw devices
Message-Id: <20020102231242.GA27352@localhost>
References: <4F5EF80AA509D211BB340000F6B7DF9B932F5E@wtmah05>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4F5EF80AA509D211BB340000F6B7DF9B932F5E@wtmah05>
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
Date: Wed Jan  2 17:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Wednesday, 02 January 2002, at 10:15:28 +0200,
Yaniv Gueta wrote:

> i recently installed lvm 1.0.1-rc4 on kernel 2.4.7-10
> but i didnt understand how to create a char raw device
> is there any howto ?
> 
raw devices are not LVM specific as far as I know. There is a utility
called "raw" that is used to bind block devices to raw devices.

More information, man raw (package util-linux under in Debian).

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian Linux Woody (P166 64 MB RAM)
 
jdomingo AT internautas DOT   org  => Spam at your own risk
