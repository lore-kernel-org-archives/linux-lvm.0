Message-ID: <3E3FC8F6.5050405@ibourgogne.net>
From: =?ISO-8859-15?Q?S=E9bastien_GALLET?= <sgallet@ibourgogne.net>
MIME-Version: 1.0
References: <20030129151209.GB2200@elrond.lohmann-services.de> <20030129151819.GE802@tykepenguin.com> <20030129153229.GC2200@elrond.lohmann-services.de> <20030129154207.GF802@tykepenguin.com> <20030129155936.GA2428@elrond.lohmann-services.de> <20030129160958.GG802@tykepenguin.com>
In-Reply-To: <20030129160958.GG802@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm and fai
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
Date: Tue Feb  4 08:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, linux-fai@uni-koeln.de

Hello guys,
This message is for the debian maintainer of lvm package.
I've got a little problem using fai (Fully Automatic Installation) and lvm.
My server runs lvm.
When creating fai-nfsroot (using debootstrap) with lvm activated, 
debootstrap stops with this message :

# vgcfgbackup -- ERROR: VGDA in kernel and lvmtab are NOT consistent; 
please run vgscan
# dpkg: error processing lvm10 (--configure):
# subprocess post-installation script returned error exit status 98
# Errors were encountered while processing:
# lvm10

I suppose that my server configuration interferes with the one in 
debootstrap.

Why include vgcfgbackup in postinst scripts ? Is it possible do it in 
"silent" mode even if there's errors ?

Sorry for speaking so badly English :):)

TIA
