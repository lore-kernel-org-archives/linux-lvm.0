Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] RedHat 7.0?
References: <003601c104e9$fb47c3c0$0300000a@pacbell.net>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 05 Jul 2001 08:15:57 +0200
In-Reply-To: "Erick Calder"'s message of "Wed, 4 Jul 2001 17:32:32 -0700"
Message-ID: <wv4rsr295u.fsf@freeze.oslo.dnmi.no>
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

>>>>> "Erick" == Erick Calder <e@arix.com> writes:

    Erick> I recently read that applying the LVM patches to the RH
    Erick> kernel doesn't work... so I downloaded Linus' kernel
    Erick> (2.2.19) and seem unable to patch it on account of not
    Erick> having a rawid patch available... I've looked in the
    Erick> directory specified in the HOWTO but there is no patch for
    Erick> 2.2.19... when I type "make" in the PATCHES directory I
    Erick> get:

    Erick> You haven't applied the rawio patch, please see the README
    Erick> make: *** [check_rawio] Error 1

Just use the 2.2.18 patch, I've used it for 2.2.19 and 2.2.20pre
without problems

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
