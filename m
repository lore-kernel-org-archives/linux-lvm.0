In-Reply-To: <20030720215701.11710.28072.Mailman@hermes.sistina.com>
Subject: Re: [linux-lvm] ERROR: no physical volumes usable to extend volume group "movies"
Message-ID: <OFD875D225.3B7500B3-ONC1256D69.007B32C5-C1256D69.007B875B@falkonline.nu>
From: patrik@falkonline.nu
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
Date: Sun Jul 20 17:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com




Hi!

I solved the problem... I used "vgextend movies
/dev/ide/host0/bus0/target1/lun0/part7" instead and it worked. Strange?


Best regards
Patrik
