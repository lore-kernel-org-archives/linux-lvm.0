From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm
Message-ID: <20020809150118.GD25223@colombina.comedia.it>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com> <20020808172939.GA18645@colombina.comedia.it> <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com> <20020809061302.GA22782@colombina.comedia.it> <OE183IR6t6c6oghBePr00001338@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OE183IR6t6c6oghBePr00001338@hotmail.com>
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
Date: Fri Aug  9 10:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Fri, Aug 09, 2002 at 09:49:45AM -0300, Jorge Melhado wrote:
> Then, if I enter with root passwor I can�t change /etc/fstab because it�s in
> readonly mode. So, I reboot again and the problem persists.
mount -o remount,rw /

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
