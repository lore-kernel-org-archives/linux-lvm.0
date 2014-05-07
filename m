Message-ID: <536A2F84.8040404@redhat.com>
Date: Wed, 07 May 2014 15:05:08 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <01D739DB1544554DB374FFC82934E6DC1D332E@GTLBMLXEN0009.bagmail.net>
In-Reply-To: <01D739DB1544554DB374FFC82934E6DC1D332E@GTLBMLXEN0009.bagmail.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvextend on snapshotted lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Matthes.Henning.extern@bertelsmann.de

On 05/07/2014 09:38 AM, Matthes.Henning.extern@bertelsmann.de wrote:
> Hello,
>
>
> why is it not possible to extend a lv, how long a snapshot of it exist.

Hello, I would say a design decision - snapshots were meant mostly for 
short-term usage e.g. while creating a backup copy of a snapshot.

If you need more flexibility have a look at thin snapshots.

Regards,

-- Marian

>
>
> Kind regards
> Mit freundlichen Gr��en
>
> Henning Matthes
>
> perl -00pe0
>
> Unix System Administration / Infrastructure Services / NMS-OSV(extern)
>
> Externe Fachkraft der:
> -------------------------------------------------
> arvato Systems GmbH
> An der Autobahn 200
> 33333 G�tersloh
>
> Phone: +49 5241 80-49591
> E-Mail: matthes.henning.extern@bertelsmann.de<mailto:matthes.henning.extern@bertelsmann.de>
>
>
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> arvato Systems GmbH: Sitz G�tersloh | Amtsgericht G�tersloh HRB 3981
> Gesch�ftsf�hrer: Birger T. Aasland | Beate Bruelheide | Dr. Michael Pesch (Vorsitzender)
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> Diese E-Mail und eventuelle Anlagen k�nnen vertrauliche und/oder rechtlich gesch�tzte Informationen enthalten. Wenn Sie
> nicht der richtige Adressat sind oder diese E-Mail irrt�mlich erhalten haben, informieren Sie bitte sofort den Absender und
> vernichten Sie diese E-Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe dieser E-Mail sind nicht gestattet.
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> This e-mail and any attachments may contain confidential and/or privileged information. If you are not the intended recipient
> (or have received this e-mail in error) please notify the sender immediately and destroy this e-mail. Any unauthorized copying,
> disclosure or distribution of the material in this e-mail is forbidden.
> -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> Bitte denken Sie �ber Ihre Verantwortung gegen�ber der Umwelt nach, bevor Sie diese E-Mail ausdrucken!
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
