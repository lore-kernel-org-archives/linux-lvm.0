Subject: Re: [linux-lvm] LVM kernel patch request
References: <OF9050ED8F.CEC7BA29-ON85256AE3.0053EEC0@mkm.can.ibm.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 13 Oct 2001 10:53:50 +0200
In-Reply-To: <OF9050ED8F.CEC7BA29-ON85256AE3.0053EEC0@mkm.can.ibm.com>
Message-ID: <wvsncn2a5d.fsf@freeze.oslo.dnmi.no>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "David" == David R Scott/Markham/IBM <dscott7@ca.ibm.com> writes:

    David> I am trying to install LVM-1.0.1-rc4 on a S/390 SuSe 7.0
    David> system with kernel 2.2.16.  Has anyone successfully managed
    David> to create a patch for kernel 2.2.16 ?  I have copied the
    David> fragments-2.2.18 to 2.2.16 and have made the
    David> lvm-1.0.1-rc4-2.2.16.patch file.  It will need some
    David> reworking to get the patch to apply correctly.  Has anyone
    David> else succeded in doing this, and have they shared the patch
    David> file ?

Upgrade to 2.2.19 (or 2.2.20pre?). There are a lot of important fixes
between 2.2.16 and the latest as far as I can recall and you'll make
your life easier by doing so.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
