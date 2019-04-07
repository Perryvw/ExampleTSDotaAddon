declare interface Timers {
    CreateTimer(delay: number, callback: (this: void) => void|number): void;
    CreateTimer<T>(delay: number, callback: (this: void, context: T) => void|number, context: T): void;
}
declare var Timers: Timers;