From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] [OT] Encrypted FS performance hit?
Message-ID: <20030312221707.GB15196@gw.silicide.dk>
References: <20030312220650.DPRI1864.imf54bis.bellsouth.net@tiger2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030312220650.DPRI1864.imf54bis.bellsouth.net@tiger2>
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
Date: Wed Mar 12 16:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 12, 2003 at 05:08:49PM -0500, Greg Freemyer wrote:
> All,
> 
> I know this is off-topic, but does anyone know where I can find info on the CPU hit from using a software encrypting FS.

well, i'll quickly bring in some LVM stuff, as i run encryption both under
and ontop of a LVM-system. (different cihper though).


> In particular I would like to see a comparison between None, Microsoft EFS, and Linux loopback encryption.

well, isnt EFS a FS encryption? loopback is a block encryption, there is a
difference. My experience is that i with loop-AES or PPDD, (blowfish as
cipher) gets about 1/4 to 1/3 of the performance of raw.



JonB
