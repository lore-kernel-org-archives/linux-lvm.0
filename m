Subject: Re: [linux-lvm] lvm and Debian
References: <E16RWI7-00083Z-00@arwen.dev33.cvf>
    <wvpu47hqdr.fsf@freeze.oslo.dnmi.no> <E16RX7u-0000Su-00@arwen.dev33.cvf>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <E16RX7u-0000Su-00@arwen.dev33.cvf>
Message-Id: <wvk7ufhou6.fsf@freeze.oslo.dnmi.no>
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
Date: Fri Jan 18 05:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Pierrick" == Pierrick PONS <ppons@cvf.fr> writes:

    Pierrick> Oh I'm really interested in getting these packages, but
    Pierrick> could you give us the source to add in the source.list
    Pierrick> which permits obtaining these packages ?

deb http://ftp.se.debian.org/debian/ woody main non-free contrib
deb http://ftp.se.debian.org/debian-non-US woody/non-US main contrib non-free

[Adjust .se. to country of choice]

BUT if you're running potato then you'll end up with a new libc6 as a
minimum so be careful.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
